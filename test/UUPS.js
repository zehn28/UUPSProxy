
const { expect } = require("chai");
const { ethers, upgrades } = require("hardhat");

describe("Lock", function () {
  beforeEach(async function () {

    const StakingContract = await ethers.getContractFactory('StakingContract');
    const stakingContract = await upgrades.deployProxy(StakingContract);
    await stakingContract.deployed();
    console.log('Token address:', stakingContract.address);
  })

  describe("Deployment", function () {
    it("Should set the right unlockTime", async function () {
    
    });

    
});
});
