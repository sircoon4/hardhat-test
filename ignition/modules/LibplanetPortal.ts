import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const LibplanetPortalModule = buildModule("LibplanetPortalModule", (m) => {

  const libplanetPortal = m.contract("LibplanetPortal");

  return { libplanetPortal };
});

export default LibplanetPortalModule;