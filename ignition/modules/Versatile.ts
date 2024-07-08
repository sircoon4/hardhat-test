import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const VersatileModule = buildModule("VersatileModule", (m) => {

  const versatile = m.contract("Versatile");

  return { versatile };
});

export default VersatileModule;