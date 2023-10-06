const rl = require('readline');

const readline = rl.createInterface({
    input: process.stdin,
    output: process.stdout
});


const readLineAsync = msg => {
    return new Promise(resolve => {
        readline.question(msg, userRes => {
            resolve(userRes);
        });
    });    
}

const Encode = async () => {
  const str = await readLineAsync("Enter string to encode: ");
  readline.close();
 console.log("Encoded string is ", btoa(str)) 
}

const Decode = async () => {
  const str = await readLineAsync("Enter string to decode: ");
  readline.close();
  console.log("Decoded string is ", atob(str)) 
}

Encode();
Decode();
