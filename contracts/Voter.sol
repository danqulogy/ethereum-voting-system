pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;


contract Voter {
  
  uint[] public votes;
  string[] public candidates;
  mapping (address => bool) hasVoted;
  
  constructor(string[] memory _candidates) public {
    candidates = _candidates;
    votes.length = candidates.length;
  }

  //use to cast a vote. Acceppts the index of candidate in candidates[]
  function vote(uint candidate) public {
   
    // Validate if the argument is valid
    require(0 <= candidate && candidate < candidates.length, "Invalid candidate");
    require(!hasVoted[msg.sender], "Account has already voted");

    votes[candidate] = votes[candidate] + 1;
    hasVoted[msg.sender] = true;
  }


// Returns a list of candidates
  function getCandidates() view public returns (string[] memory) {
    return candidates;
  }


  function getVotes() view public returns (uint[] memory) {
    return votes;
  }


}
