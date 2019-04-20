const Migrations = artifacts.require("Voter");


module.exports = function (deployer) {
  deployer.deploy(Migrations, ["Akuffo Addo", "John Mahama"]);
};
