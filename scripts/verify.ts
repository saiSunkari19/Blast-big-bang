import hre from "hardhat";

async function main() {
 await hre.run("verify:verify", {
    address: "0x53C583Bf71F6Ddb8695863a945A59eBC42808576",
    constructorArguments: [
      "BlastCollection",
      "BC",
    ],
  });
  console.log(`Token Address verified`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


// Contract : 0x53C583Bf71F6Ddb8695863a945A59eBC42808576
