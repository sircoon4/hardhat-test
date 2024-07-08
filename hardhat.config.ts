import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    geth: {
      url: "http://localhost:8000",
      chainId: 12345
    }
  }
};

export default config;
