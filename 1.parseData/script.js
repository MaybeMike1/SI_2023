import fs from 'fs';
import { XMLParser } from 'fast-xml-parser';
import csvParser from 'csv-parser';
import yaml from 'yaml'

// Takes the path of a file and runs the corresponding parser-function based on the fileextension.

async function fileSelector(path) {
    let fileExtension = path.match(/\.[0-9a-z]+$/i)[0];
    console.log('Following fileextension was parsed', fileExtension);
    let fileContent = fileExtension === '.csv' ? fs.createReadStream(path) : fs.readFileSync(path, "utf-8");
    let object = {}
    switch(fileExtension){
        case '.csv':
            object = await parseCSV(fileContent);
            console.log(fileExtension,object)
            break;
        case '.txt':
            object = parseTXT(fileContent);
            console.log(fileExtension,object)
            break;
        case '.json':
            object = parseJSON(fileContent);
            console.log(fileExtension,object)
            break;
        case '.xml':
            object = parseXML(fileContent);
            console.log(fileExtension,object)
            break;
        case '.yaml':
            object = parseYAML(fileContent);
            console.log(fileExtension,object)
            break;
        default:
            console.log('Object cant be transformed to' + fileExtension);
            break;
    }
    return object;
}

function parseJSON(content) {
    return JSON.parse(content);
}

function parseXML(content){
    const parser = new XMLParser();
    let object = parser.parse(content).me;
    object.hobbies = [...object.hobbies.hobby]
    return object;
}

function parseTXT(content) {
    let textSegment = content.split(" ");
    let object = {};

    object.name = textSegment[0];
    object.age = parseInt(textSegment[1]);
    object.hobbies = textSegment[2].split(",");
    return object;
}

function parseYAML(content) {
    return yaml.parse(content);
}

    function parseCSV(content) {
        let res = [];
        return new Promise((resolve, reject) => {
            content.pipe(csvParser())
                .on('data', (data) => res.push(data))
                .on('end', () => {
                    res = res[0]
                    res.hobbies = res.hobbies.split(" ")
                    resolve(res);
                })
                .on('error', (error) => {
                    reject(error);
                });
        });
    }

// Calling fileSelector with all data files descripting me.


fileSelector('./data/me.json');
fileSelector('./data/me.xml');
fileSelector('./data/me.txt');
fileSelector('./data/me.yaml');
fileSelector('./data/me.csv');