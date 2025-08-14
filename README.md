# Skill-NFT-Verification-Mint-when-teacher-signs-off
# 🎓 SkillNFT: Verified Skill Certificates on Aptos Blockchain

## 📜 Description

**SkillNFT** is a smart contract written in Move for issuing non-fungible tokens (NFTs) that represent verified skills or certifications. It enables a trusted issuer (typically a teacher, trainer, or organization) to mint NFTs to recipients (students) as proof of skill verification.

Each NFT is minted under a common collection called `VerifiedSkills` and contains metadata like the skill name and a link to the certificate or additional details.

---

## 🌟 Vision

In a world increasingly valuing verified skills over traditional degrees, **SkillNFT** provides a decentralized and transparent way to:

- Certify skills without central authorities.
- Create a permanent, verifiable, and tamper-proof record.
- Empower learners to showcase their achievements globally.

---

## 🚀 Future Scope

Here’s what can be added to expand this project further:

- ✅ **Dynamic NFT Metadata**: Update NFT data to reflect progress or re-certifications.
- 🏢 **Multi-issuer Support**: Allow multiple teachers or institutions to register and issue under their own collections.
- 📊 **Analytics Dashboard**: Build a front-end to visualize issued skills, student records, and more.
- 🔐 **Access Control**: Introduce admin roles and verifiable credentials for issuers.
- 🔗 **Integration with LinkedIn / GitHub**: Allow users to link and verify skills on professional platforms.

---

## 📄 Contract Details

- **Contract Name**: `SkillNFT`
- **Deployed Address**: `0xc4ff66a3b97d2c0e59c88ed184d4a81bfdabf52698e063585141e280d54219d00xABCD`
- <img width="878" height="556" alt="image" src="https://github.com/user-attachments/assets/19e017ca-a2a3-4d27-abcf-f683430e7ea3" />

- **Collection Name**: `VerifiedSkills`
- **Standard**: Aptos NFT (using `aptos_framework::token`)

---

## 🛠 How It Works

- `init_collection(teacher: &signer)`: Initializes the NFT collection (run once by the teacher).
- `mint_skill_nft(teacher: &signer, student: address, skill_name: vector<u8>, uri: vector<u8>)`: Mints a new skill NFT to the student.

---

## 🧪 Requirements

- Aptos CLI
- Aptos Account (Testnet or Devnet)
- Move language support

---

## 🤝 Contributing

PRs and suggestions are welcome! Let's build the future of verified learning, together.

