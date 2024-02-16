import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  networks: {
    testnet: {
      url: process.env.BLAST_TESTNET_RPC,
      chainId: 168587773,
      accounts: [process.env.PRIVATE_KEY!],
    },
    mainnet: {
      url: process.env.BLAST_MAINNET_RPC,
      chainId: 1234,
      accounts: [process.env.PRIVATE_KEY!],
    },
  },
  etherscan: {
    apiKey: {
      blast_sepolia: process.env.BLAST_TESTNET_ETHERSCAN_API_KEY!, // apiKey is not required, just set a placeholder
    },
    customChains: [
      {
        network: "blast_sepolia",
        chainId: 168587773,
        urls: {
          apiURL:
            "https://api.routescan.io/v2/network/testnet/evm/168587773/etherscan",
          browserURL: "https://testnet.blastscan.io",
        },
      },
    ],
  },
};

export default config;
