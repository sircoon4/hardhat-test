const hre = require("hardhat");

async function main() {
    const accounts = await hre.ethers.getSigners();
    const contractAddress = "0xD8f96b8E1a17e3A6011557ea5715Efb1172a37F3";

    const TransactionParser = await hre.ethers.getContractFactory("TransactionParser");
    const transactionParser = await TransactionParser.attach(contractAddress);
    const transactionParserWithSigner = transactionParser.connect(accounts[0]);

    let utf8Encode = new TextEncoder();

    var serializedPayload;
    var result;

    serializedPayload = utf8Encode.encode("ZDE6UzcxOjBFAiEAyvaMltM6Yd7M2tXoKi2svYjIyIIrHb3ZOuJp2C54Ro8CIGvLL6DgODLYS9kKB5AAB3rhr29WeB2gigqdIJQEPbhHMTphbGR1Nzp0eXBlX2lkdTIyOmV4cGxvcmVfYWR2ZW50dXJlX2Jvc3N1Njp2YWx1ZXNkdTEzOmF2YXRhckFkZHJlc3MyMDr1lcjRhouvmYfv9u83t3+dXnx76HU4OmNvc3R1bWVzbDE2OmzzZyAOikZGia7o7G9L5/8xNjrXc8pzP5riSZWC3YGIHHVEMTY6SxKCmAO+jUuqAwRCtvFQimV1MTA6ZXF1aXBtZW50c2wxNjptYhIDCAYYQ5UEmJvcBnbvMTY6nMZjNN/GQkWZ1s0/Fd210DE2OpblZ14n4ftJtFVmVN5dy50xNjrRsFBhn/ZSSakCf20/xgZsMTY6i2TJcUjDgk+xYyeTPVQ6YjE2Ory0ZrIkXx1Ao7abFqLckqExNjrWBLPU40NsQLGt4kdqSpqwZXU1OmZvb2RzbGV1MjppZDE2Oi5XDqIwys9Ol9QOFhbsPiR1MTpybGx1MTowdTU6MTAwMTJlbHUxOjF1NToxMDAxMWVsdTE6M3U1OjEwMDI5ZWx1MTo0dTU6MTAwMDNlbHUxOjZ1NToxMDAwMmVsdTE6N3U1OjIwMDAxZWV1NjpzZWFzb25pMWVlZWUxOmczMjpFgiUNDaM7BneahHXSg9XdIQxoO5uZnXTQP6xPWPprzjE6bGkxZTE6bWxkdTEzOmRlY2ltYWxQbGFjZXMxOhJ1NzptaW50ZXJzbnU2OnRpY2tlcnU0Ok1lYWRlaTEwMDAwMDAwMDAwMDAwMDAwMDBlZTE6bmkyNDg0ZTE6cDY1OgRGb/NIPk7XOh3sKyt7ybABoz7vlYE6pagZXcBesbBcLU3pn2noeE+gqyyGUVaGa37OQ6QskzRnhYnb7ETmcZUGMTpzMjA6B4QmPkZhC1rqpBDthNmX1Q47iDMxOnR1Mjc6MjAyNC0wNy0wOVQwMjoxODoxMC4zMDk3OTVaMTp1bGVl");
    result = await transactionParserWithSigner.parseTransaction(serializedPayload);
    console.log("Transaction result:");
    console.log(result.toObject());

    
    result = await transactionParserWithSigner.parseExploreAdventureBoss(serializedPayload);
    console.log("Explore Adventure Boss result:");
    console.log(result.toObject());
    console.log();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});