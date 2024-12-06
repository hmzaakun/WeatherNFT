# WeatherNFT Project 🌦️

## Description 📜

The **WeatherNFT** project is a smart contract-based application that allows users to mint NFTs representing weather conditions. These NFTs are dynamic, meaning their metadata can be periodically updated to reflect new weather data, including:

- 🌡️ Temperature
- 💧 Humidity
- 🌬️ Wind Speed
- 🖼️ A visual image of the weather
- 📝 Additional weather information

This project was built using Solidity and deployed on the Avalanche Fuji Testnet.

---

## Features ✨

### Core Functionalities:

- **Mint NFTs** 🖼️:
  - Users can mint unique WeatherNFTs.
- **Update Metadata** 🔄:
  - The contract owner can update the weather data associated with each NFT.
- **Historical Weather Data** 📊:
  - Retrieve weather metadata for a specific period (e.g., today, last week).

---

## Smart Contract Details 🔐

- **Contract Name**: `WeatherNFT`
- **Token Standard**: ERC721
- **Contract Address**: [0xaA3cf2F40F9Bb1922c7c25f5E5357594F076eBdA](https://testnet.snowtrace.io/address/0xaA3cf2F40F9Bb1922c7c25f5E5357594F076eBdA)

---

## Prerequisites 🛠️

- **Remix IDE** (for development and testing)
- **MetaMask** wallet connected to the Avalanche Fuji Testnet
- **AVAX Testnet Tokens** for deploying and interacting with the contract

---

## How to Use 🚀

### Deployment:

1. Open the contract in [Remix IDE](https://remix.ethereum.org).
2. Compile the `WeatherNFT` contract using Solidity version `^0.8.20`.
3. Deploy to the Avalanche Fuji Testnet.

### Interacting with the Contract:

- **Minting an NFT**:

  1. Call the `mintWeatherNFT` function.
  2. The minted NFT will be assigned to the caller's address.

- **Updating Metadata**:

  1. Call the `updateWeatherMetadata` function as the contract owner.
  2. Provide updated weather data, including temperature, humidity, wind speed, image, and additional info.

- **Fetching Historical Data**:
  1. Use `getWeatherData` with the desired `tokenId` and the number of `daysAgo`.

---

## Tools & Technologies 🧰

- **Solidity**: For writing the smart contract
- **OpenZeppelin**: For ERC721 and Ownable functionality
- **Remix IDE**: Development and deployment
- **Avalanche Fuji Testnet**: Deployment network

---

## Project Deployed 🎥

- Explore the contract on the Avalanche Fuji Testnet:
  [View on Snowtrace](https://testnet.snowtrace.io/address/0xaA3cf2F40F9Bb1922c7c25f5E5357594F076eBdA)
