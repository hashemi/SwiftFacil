//
//  main.swift
//
//
//  Created by Ahmad Alhashemi on 16/01/2024.
//

import CFacil

func on_request(_ request: UnsafeMutablePointer<http_s>?) {
    var data = Array<UInt8>("txt".utf8)
    _ = data.withUnsafeMutableBufferPointer { buf in
        http_set_header(
            request,
            HTTP_HEADER_CONTENT_TYPE,
            http_mimetype_find(buf.baseAddress, buf.count)
        )
    }

    var data2 = Array<UInt8>("Hello, world!".utf8)
    _ = data2.withUnsafeMutableBufferPointer { buf in
        http_send_body(
            request,
            buf.baseAddress,
            UInt(buf.count)
        )
    }
}

let settings = http_settings_s(on_request: on_request,
                               on_upgrade: nil,
                               on_response: nil,
                               on_finish: nil,
                               udata: nil,
                               public_folder: nil,
                               public_folder_length: 0,
                               max_header_size: 0,
                               max_body_size: 0,
                               max_clients: 0,
                               tls: nil,
                               reserved1: 0,
                               reserved2: 0,
                               reserved3: 0,
                               ws_max_msg_size: 0,
                               timeout: 0,
                               ws_timeout: 0,
                               log: 0,
                               is_client: 0)

http_listen("3000", nil, settings)
fio_start(.init(threads: 4, workers: 4))
