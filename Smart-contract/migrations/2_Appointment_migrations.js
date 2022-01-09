const appointment = artifacts.require("appointment");

module.exports = function (deployer) {
  deployer.deploy(appointment);
};
