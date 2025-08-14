module MyModule::SkillNFTVerification {
    use aptos_framework::signer;
    use std::string::{Self, String};
    use std::vector;

    /// Struct representing a skill NFT with teacher verification
    struct SkillNFT has store, key {
        skill_name: String,        // Name of the skill (e.g., "Advanced Mathematics")
        student: address,          // Address of the student who earned the skill
        teacher: address,          // Address of the teacher who verified the skill
        verified: bool,            // Whether the skill has been verified by teacher
        issue_date: u64,           // Timestamp when the NFT was issued
    }

    /// Struct to store all skill NFTs for a student
    struct StudentSkills has store, key {
        skills: vector<SkillNFT>,  // Vector of all skill NFTs owned by student
    }

    /// Function to mint a new skill NFT (initially unverified)
    public fun mint_skill_nft(
        student: &signer, 
        skill_name: String, 
        teacher_address: address,
        timestamp: u64
    ) acquires StudentSkills {
        let student_addr = signer::address_of(student);
        
        let skill_nft = SkillNFT {
            skill_name,
            student: student_addr,
            teacher: teacher_address,
            verified: false,
            issue_date: timestamp,
        };

        // Initialize student skills storage if it doesn't exist
        if (!exists<StudentSkills>(student_addr)) {
            let student_skills = StudentSkills {
                skills: vector::empty<SkillNFT>(),
            };
            move_to(student, student_skills);
        };

        // Add the new skill NFT to student's collection
        let student_skills = borrow_global_mut<StudentSkills>(student_addr);
        vector::push_back(&mut student_skills.skills, skill_nft);
    }

    /// Function for teacher to verify and sign off on a student's skill NFT
    public fun teacher_sign_off(
        teacher: &signer,
        student_address: address,
        skill_index: u64
    ) acquires StudentSkills {
        let teacher_addr = signer::address_of(teacher);
        let student_skills = borrow_global_mut<StudentSkills>(student_address);
        
        // Get the specific skill NFT by index
        let skill_nft = vector::borrow_mut(&mut student_skills.skills, skill_index);
        
        // Verify that this teacher is authorized to sign off on this skill
        assert!(skill_nft.teacher == teacher_addr, 1); // Error: Unauthorized teacher
        assert!(!skill_nft.verified, 2); // Error: Already verified
        
        // Sign off on the skill NFT
        skill_nft.verified = true;
    }
}