pragma solidity ^0.4.24;

import "@aragon/os/contracts/apps/AragonApp.sol";
import "@aragon/os/contracts/lib/math/SafeMath.sol";

contract TwitterApp is AragonApp {
    using SafeMath for uint256;

    //Events
    event PostTwitt(address indexed entity, uint256 step);

    ///ACL
    bytes32 constant public POST_ROLE = keccak256("POST_ROLE");

    function initialize() onlyInit public {
        initialized();
    }

    function post(uint256 a) auth(POST_ROLE) external {

    }
}
