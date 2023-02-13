const string = "adnkakdajsdnkøaksdn";

let encodeStr = Buffer.from(string, "utf-8");
console.log(encodeStr.toString("ascii"))

console.log("encoded string", encodeStr);

let decodedStr = encodeStr.toString();

console.log("decoded string", decodedStr);