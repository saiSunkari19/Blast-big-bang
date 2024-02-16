import hre from "hardhat";

async function main() {
 await hre.run("verify:verify", {
    address: "0xaA93253A7a93fA89201c06c33084313CDDdA36Dd",
    constructorArguments: [
    
    ],
  });
  console.log(`Token Address verified`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


// Proxy : 0xaA93253A7a93fA89201c06c33084313CDDdA36Dd
// Contract : 0xaA93253A7a93fA89201c06c33084313CDDdA36Dd
// Proxy Admin : 0xf7297B9A13984e5BEd318b82A85aFdbBe8Ec882E