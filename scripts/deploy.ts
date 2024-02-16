import { ethers } from "hardhat";

async function main() {
  const contract = await ethers.deployContract("BlastCollection", [
    "BlastCollection",
    "BC",
  ]);

  await contract.waitForDeployment();

  console.log(`Blast  deployed to ${contract.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
