async function main() {

const Repump = await ethers.getContractFactory("RepumpToken");

const wallets = [
"0x0000000000000000000000000000000000000001"
];

const token = await Repump.deploy(
"Repump Token",
"RPMP",
1000000,
wallets
);

await token.waitForDeployment();

console.log("Contract deployed:", await token.getAddress());

}

main();
