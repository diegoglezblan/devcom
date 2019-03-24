pragma solidity >=0.4.22 <0.6.0;
contract ProfileManager {

    //bytes32[] profiles;
    
    mapping(bytes32 => bool) profiles;
    
    struct Member {
        bytes32 profile;
        uint256 creationDate;
        bool exists;
    }
    struct Conditions {
        /*The transition from initial to final profile exists.*/
        bool initToFinalProfileExists;
        uint256 requestedTime;
        uint256 requestedContributions;
        
    }
    struct TransitionDetails {
        mapping(bytes32 =>bool) initialProfiles;
        //conditions 
    }    
    
    mapping(address => Member) members;
    
    /*key: destinyProfile | value: (key : initialProfile | value: Necessary conditions to pass from one profile to another)*/
    mapping(bytes32 => mapping(bytes32 => Conditions)) transitionRegister;
    
    function addProfile(bytes32 newProfile) public {
        profiles[newProfile] = true;
    } 
    
    function assignProfileToMember(address member, bytes32 profile) public {
        require(members[member].exists);
        //check if new profile can be assign to member given his current profile.
        bytes32 memberProfile = members[member].profile;
        require(transitionRegister[profile][memberProfile].initToFinalProfileExists);
        //check profile restrictions (time, contributions, etc). 
        members[member].profile = profile;
    }
    
    function addTransition(bytes32 initialProfile, bytes32 finalProfile /*, condition*/) public {
        /*Both initial and final profile should exists.*/
        require(profiles[initialProfile]);
        require(profiles[finalProfile]);
        
        transitionRegister[finalProfile][initialProfile].initToFinalProfileExists = true;
        //transitionRegister[finalProfile][initialProfile].requestedTime = condition.requestedTime;
        //...
        
    }
}