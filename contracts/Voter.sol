pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;


contract Voter {
  
  struct Candidate{
    uint position;
    bool exist;
  }

  uint[] public votes;
  string[] public candidates;
  mapping (address => bool) hasVoted;
  mapping (string => Candidate) posOfCandidate;

  
  
  constructor(string[] memory _candidates) public {
    candidates = _candidates;
    votes.length = candidates.length;

    for(uint i = 0; i < candidates.length; i++ ){
      Candidate memory candidate =  Candidate(i,true);
      string memory candidateName =candidates[i];
      posOfCandidate[candidateName] = candidate;
    }
  }

  //use to cast a vote. Acceppts the index of candidate in candidates[]
  function vote(uint candidate) public {
   
    // Validate if the argument is valid
    require(0 <= candidate && candidate < candidates.length, "Invalid candidate");
    require(!hasVoted[msg.sender], "Account has already voted");


    votes[candidate] = votes[candidate] + 1;
    hasVoted[msg.sender] = true;
  }

  function vote(string memory candidateName) public {
    require(!hasVoted[msg.sender], "Account has already voted");

    Candidate memory candidate = posOfCandidate[candidateName];

    if((candidate.position == 0 && !candidate.exist)){
        revert("Candidate does not exist");
    }
    
    votes[candidate.position] = votes[candidate.position] +1;
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
