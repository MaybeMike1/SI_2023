import axios from "axios";

async function login() {
  const res = await axios.post("https://fiotext.com/login");
  return res.data;
}


async function signUp() {
    const res = await axios.post("https://fiotext.com/sign-up");
    return res.data;
}

async function send
const SMSClient = {};
