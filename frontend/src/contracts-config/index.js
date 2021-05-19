import { default as ERC20 } from "../../../build/contracts/IERC20.json";
import { default as faucet } from "../../../build/contracts/Faucet.json";

const options = [
  {
    contractName: "GLD",
    label: "测试Token GLD",
    address: "cfxtest:ace0ea1x6st1spm1jwfces43tder2yewz2vtx8hxrt"
  },
  {
    contractName: "DMD",
    label: "测试Token DMD",
    address: "cfxtest:type.contract:acg4kb024uwn2cr9682s5ar0yk7zx2vuja20bwrx46",
    disabled: false
  },
  {
    contractName: "BIGGLD",
    label: "测试Token BIG GLD",
    address: "cfxtest:type.contract:acd29kfdf8wyz41dczw1sj9jua9523047681m9rjfs",
    disabled: false
  }
];

const faucetAddress = "cfxtest:acdy33ccw5k56xbcrbz10pycdjvt58k91y1kudkn2d"

let config = {}
options.forEach((option) => {
  config[option.contractName] = {
      abi: ERC20.abi,
      bytecode: ERC20.bytecode,
      address: option.address,
      label: option.label,
      disabled: option.disabled
  }
})

const faucetContractConfig = {
    abi: faucet.abi,
    bytecode: faucet.bytecode,
    address: faucetAddress
  }
  
export { config, faucetContractConfig };