import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const ActionParserModule = buildModule("ActionParserModule", (m) => {

  const actionParser = m.contract("ActionParser");

  return { actionParser };
});

export default ActionParserModule;