//
//  File.swift
//  
//
//  Created by Hiren on 18/03/24.
//

import Foundation


// MARK: - WordMeaningModel
struct WordMeaningModel: Codable {
    let error: Bool
    let message: String
    let data: WordMeaningModelData
}

// MARK: - WordMeaningModelData
struct WordMeaningModelData: Codable {
    let data: WordMeaninDetailData
}

// MARK: - DataData
struct WordMeaninDetailData: Codable {
    let wordEnglish: String
    let image, imageCompress, imageDescEng, wordMeaningEng: [String]
    let wordMeaningPOS, wordExampleEng, wordSynonym, wordAntonym: [String]
    let type: String
    let wordMeaningTranslated, imageDescTranslated, imageDescTranslatedBold, wordMoreMeaningTranslated: [String]
    let link: String
    let compressLink: String

    enum CodingKeys: String, CodingKey {
        case wordEnglish = "word_english"
        case image, imageCompress
        case imageDescEng = "image_desc_eng"
        case wordMeaningEng = "word_meaning_eng"
        case wordMeaningPOS = "word_meaning_p_o_s"
        case wordExampleEng = "word_example_eng"
        case wordSynonym = "word_synonym"
        case wordAntonym = "word_antonym"
        case type
        case wordMeaningTranslated = "word_meaning_translated"
        case imageDescTranslated = "image_desc_translated"
        case imageDescTranslatedBold = "image_desc_translated_bold"
        case wordMoreMeaningTranslated = "word_more_meaning_translated"
        case link, compressLink
    }
}

