//
//  RadioStations.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import Foundation
import SwiftUI

struct RadioStation {
    var name: String
    var image: String
    var url: String
    var logo: String
    var smallImage: String
}

let radioStations: [RadioStation] = [
    RadioStation(
        name: "Radio Comercial",
        image: createFavicon(url: "https://radiocomercial.pt/"),
        url: "https://stream-icy.bauermedia.pt/comercial.mp3",
        logo: "comercial",
        smallImage: "comercial-small"
    ),
    RadioStation(
        name: "M80",
        image: createFavicon(url: "https://m80.pt/"),
        url: "https://stream-icy.bauermedia.pt/m80.mp3",
        logo: "m80",
        smallImage: "m80-small"
    ),
    RadioStation(
        name: "Cidade FM",
        image: createFavicon(url: "https://cidade.fm/"),
        url: "https://stream-icy.bauermedia.pt/cidade.mp3",
        logo: "cidade",
        smallImage: "cidade-small"
    ),
    RadioStation(
        name: "Smooth FM",
        image: "https://smoothfm.pt/favicon.ico?v=2",
        url: "https://stream-icy.bauermedia.pt/smooth.mp3",
        logo: "smooth",
        smallImage: "smooth-small"
    ),
    RadioStation(
        name: "Vodafone FM",
        image: "https://www.vodafone.pt/content/dam/favicon/favicon-32x32.png",
        url: "https://stream-icy.bauermedia.pt/vodafone.mp3",
        logo: "vodafone",
        smallImage: "vodafone-small"
    ),
    RadioStation(
        name: "RFM",
        image: createFavicon(url: "https://rfm.sapo.pt/"),
        url: "https://21633.live.streamtheworld.com/RFM_SC",
        logo: "rfm",
        smallImage: "rfm-small"
    ),
    RadioStation(
        name: "Mega Hits",
        image: "https://upload.wikimedia.org/wikipedia/pt/b/be/Log%C3%B3tipo_da_Mega_Hits.png",
        url: "https://20863.live.streamtheworld.com/MEGA_HITS_SC",
        logo: "megahits",
        smallImage: "mega-small"
    ),
    RadioStation(
        name: "Capsao",
        image: "https://i.postimg.cc/vTWQDhGR/capsao.png",
        url: "https://capsaolisboa.ice.infomaniak.ch/capsaolisboa-128.mp3",
        logo: "capsao",
        smallImage: "capsao-small"
    ),
    RadioStation(
        name: "Antena 1",
        image: "https://i.postimg.cc/9fGxdWmY/antena1.png",
        url: "https://radiocast.rtp.pt/antena180a.mp3",
        logo: "antena1",
        smallImage: "antena1-small"
    ),
    RadioStation(
        name: "Antena 2",
        image: "https://i.postimg.cc/7YfmB1P6/antena2.png",
        url: "https://radiocast.rtp.pt/antena280a.mp3",
        logo: "antena2",
        smallImage: "antena2-small"
    ),
    RadioStation(
        name: "Antena 3",
        image: "https://i.postimg.cc/x156d9Rk/antena3.png",
        url: "https://radiocast.rtp.pt/antena380a.mp3",
        logo: "antena3",
        smallImage: "antena2-small"
    ),
    RadioStation(
        name: "Açores",
        image: "https://i.postimg.cc/zBbYxqHq/acores.png",
        url: "https://streaming-live.rtp.pt/liveradio/antena1acores80a/playlist.m3u8",
        logo: "acores",
        smallImage: "acores-small"
    ),
    RadioStation(
        name: "Renascença",
        image: createFavicon(url: "https://rr.sapo.pt/"),
        url: "https://25533.live.streamtheworld.com/RADIO_RENASCENCA_SC",
        logo: "rr",
        smallImage: "rr-small"
    ),
    RadioStation(
        name: "TSF",
        image: createFavicon(url: "https://www.tsf.pt/"),
        url: "https://tsfdirecto.tsf.pt/tsfdirecto.mp3",
        logo: "tsf",
        smallImage: "tsf-small"
    ),
    RadioStation(
        name: "Rádio Observador",
        image: createFavicon(url: "https://observador.pt/radio/"),
        url: "https://23613.live.streamtheworld.com/OBSERVADORAAC_SC",
        logo: "observador",
        smallImage: "observador-small"
    ),
    RadioStation(
        name: "Golo FM",
        image: createFavicon(url: "https://golo.fm/"),
        url: "https://sp0.redeaudio.com:7175/stream/1/",
        logo: "golo",
        smallImage: "golo-small"
    ),
]

