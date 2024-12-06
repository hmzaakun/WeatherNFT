// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WeatherNFT is ERC721, Ownable {
    uint256 public tokenCounter;

    struct WeatherData {
        int256 temperature;
        uint256 humidity;
        uint256 windSpeed;
        string weatherImage;
        string additionalInfo;
        uint256 timestamp;
    }

    mapping(uint256 => WeatherData[]) private weatherHistory;

    event Minted(uint256 tokenId, address owner);
    event MetadataUpdated(uint256 tokenId, WeatherData data);

    constructor() ERC721("WeatherNFT", "WNFT") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    // Mint a new NFT
    function mintWeatherNFT() external returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);

        weatherHistory[newTokenId].push(
            WeatherData({
                temperature: 0,
                humidity: 0,
                windSpeed: 0,
                weatherImage: "",
                additionalInfo: "",
                timestamp: block.timestamp
            })
        );

        tokenCounter += 1;

        emit Minted(newTokenId, msg.sender);
        return newTokenId;
    }

    // Update metadata for a specific tokenId
    function updateWeatherMetadata(
        uint256 tokenId,
        int256 temperature,
        uint256 humidity,
        uint256 windSpeed,
        string memory weatherImage,
        string memory additionalInfo
    ) external onlyOwner {
        require(_exists(tokenId), "Token does not exist");

        WeatherData memory newWeatherData = WeatherData({
            temperature: temperature,
            humidity: humidity,
            windSpeed: windSpeed,
            weatherImage: weatherImage,
            additionalInfo: additionalInfo,
            timestamp: block.timestamp
        });

        weatherHistory[tokenId].push(newWeatherData);

        emit MetadataUpdated(tokenId, newWeatherData);
    }

    // Retrieve weather data for specific periods
    function getWeatherData(
        uint256 tokenId,
        uint256 daysAgo
    ) external view returns (WeatherData[] memory) {
        require(_exists(tokenId), "Token does not exist");

        uint256 startTime = block.timestamp - daysAgo * 1 days;
        uint256 length = 0;

        for (uint256 i = 0; i < weatherHistory[tokenId].length; i++) {
            if (weatherHistory[tokenId][i].timestamp >= startTime) {
                length++;
            }
        }

        WeatherData[] memory results = new WeatherData[](length);
        uint256 index = 0;

        for (uint256 i = 0; i < weatherHistory[tokenId].length; i++) {
            if (weatherHistory[tokenId][i].timestamp >= startTime) {
                results[index] = weatherHistory[tokenId][i];
                index++;
            }
        }

        return results;
    }

    // Utility function to check if a token exists
    function _exists(uint256 tokenId) internal view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }
}
