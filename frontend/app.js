let account;

async function connectWallet(){

if(window.ethereum){

const accounts = await ethereum.request({
method: 'eth_requestAccounts'
});

account = accounts[0];

alert("Connected: " + account);

}

}

function launch(){

const name = document.getElementById("name").value;
const symbol = document.getElementById("symbol").value;

console.log("Launching token:", name, symbol);

alert("Token launch request submitted!");

}
