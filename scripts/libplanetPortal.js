const hre = require("hardhat");
const transactions = require("./json/transactions.json");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0xB9c284F605ed46c1E3aB9a61bFA0B4090586c5c8";

    const LibplanetPortal = await hre.ethers.getContractFactory("LibplanetPortal");
    const libplanetPortal = await LibplanetPortal.attach(contractAddress);
    const libplanetPortalWithSigner = libplanetPortal.connect(accounts[0]);

    let hex = "6c6c6e6e6e33323ad301b18ad9727380867ed594f5b7f0d42a9cb2bbd26170e22f16ee1b719ec5d06e6e33323abd1b0c5a3a6132ce80c3bbf2a86757b8852d293650ea596fa4782ec1119234756e6e6e6e6e6e6e6e6e6e656c6e33323afd479f894e1a1436b155e2108d4d54204db997359878d380ee095c98f024037f33323a00a62edf6f858f79389374f2373e23e1d8b06f06fe44495f2b8b3437b462e51633323ab21bdf9f3e682759b92605f2cca22a038e39c973582788777b42de77fa1c92136e33323a1a249d8727cebd9178ec42eb763a3555afac47c6f2937d903097af8b360eca5233323abef132248691ea21a06a79d62987f…d531886f1fe330ad7ce57b8f44e1de5977d2bd002863fab3a98d84256e6e33323a0b7216383d665819a910ffd4dc5ed2275f9b7924513871264309c1100907fc186e6e6e6e6e6e6e6e6e6e656c6e33323ad6aac35d12b63b5fb06dd9c8a61d7d4ac07ff618687a7474e4254294ccdd2dcc6e6e6e33323a42983224579403006da6c2712587535608ba242d83b8ad44126c263597642ed76e6e6e6e6e6e6e6e6e6e6e656c37363a030303090604060403090305060303030602060503000606030603090303060503000604030403040307030806030303030603040309060403000606030503040306060503050309060106056c6e74656565"
    let withdrawalProof = Uint8Array.from(Buffer.from(hex, 'hex'));

    let result = await libplanetPortalWithSigner.proveWithdrawalTransaction(
      {
        nonce: 20n,
        from: "0xCE70F2e49927D431234BFc8D439412eef3a6276b",
        to: "0x47E0Dd0B503C153D7FB78c43cc9aC135C60Dfd94",
        amount: 1000n,
      },
      {
        stateRoot: "0x31d74697a51e6db3be2e85e98b9f15f9f349898c99f8ac8ff03a73ebc5581d15",
        storageRoot: "0xe7cda66caf1e1395abf9b0f41c95fc4b8b087acfca62955bc48be43684885da3",
      },
      withdrawalProof
    );

    console.log("--result--")
    console.log(result);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});