import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const HackAndSlashParserModule = buildModule("HackAndSlashParserModule", (m) => {

  const hackAndSlashParser = m.contract("HackAndSlashParser");

  return { hackAndSlashParser };
});

export default HackAndSlashParserModule;