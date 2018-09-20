//
//  RawData.swift
//  AutoLayout2
//
//  Created by Vova on 9/19/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import Foundation

class RawData {
    private static let data = [
        "Lorem ipsum dolor sit amet",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac sapien ullamcorper, ultricies quam et, pretium ligula. Morbi in augue eget nisl lacinia ultricies vel vitae arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac sapien ullamcorper, ultricies quam et, pretium ligula. Morbi in augue eget nisl lacinia ultricies vel vitae arcu",
        "Donec pellentesque dolor orci",
        "Maecenas gravida auctor ex, sed feugiat purus facilisis in. Aliquam ultrices ullamcorper neque, ut rutrum turpis facilisis non.Maecenas gravida auctor ex, sed feugiat purus facilisis in. Aliquam ultrices ullamcorper neque, ut rutrum turpis facilisis non",
        "Nam et pretium neque. Aliquam posuere maximus ante, blandit sollicitudin purus iaculis nec. Ut efficitur sodales lacinia. Nunc ut dolor sed diam fermentum pulvinar a sit amet nisl. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Praesent feugiat quam egestas, aliquam nibh sed, tristique nisi.",
        "Proin fermentum metus eget ligula vulputate, sed blandit nunc dictum.",
        "Proin ornare. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra.Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Proin ornare. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra.Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra.",
        "suscipit nisl id ornare",
        "Quisque et iaculis eros. Phasellus pharetra tellus at pellentesque vulputate.",
        "Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat. Nam eu libero nec ante facilisis feugiat.",
        "Etiam aliquam ultrices suscipit. Morbi est mi, interdum ut ultrices eu, ultrices ac ipsum",
        "Maecenas id erat ac lectus vehicula sollicitudin",
        "Mauris et sapien et enim sagittis blandit ut tempus nulla",
        "Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam.",
        "Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor. Integer aliquam id ante id tempor.",
        "Praesent viverra, felis laoreet tempor mollis",
        "nisl ante imperdiet diam",
        "at pharetra arcu leo nec nibh",
        "Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit. Vivamus non turpis vel urna blandit.",
        "Cras volutpat sodales odio",
        "id posuere nunc placerat non",
        "Donec viverra libero vel varius facilisis",
        "Sed a semper neque, id interdum purus. Quisque in ipsum rutrum, rhoncus sem id, sagittis nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris et ornare diam, sit amet maximus enim.",
        "Proin eros justo, dapibus vel lacus eget",
        "Donec pellentesque dolor orci",
        "Maecenas gravida auctor ex, sed feugiat purus facilisis in. Aliquam ultrices ullamcorper neque, ut rutrum turpis facilisis non",
        "Nam et pretium neque. Aliquam posuere maximus ante, blandit sollicitudin purus iaculis nec. Ut efficitur sodales lacinia. Nunc ut dolor sed diam fermentum pulvinar a sit amet nisl. Sed at rhoncus sem. Vivamus eu nibh urna. Mauris pharetra ornare pharetra. Praesent feugiat quam egestas, aliquam nibh sed, tristique nisi.",
        "Proin fermentum metus eget ligula vulputate, sed blandit nunc dictum.",
        "Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare. Proin ornare.",
        "suscipit nisl id ornare",
        "Quisque et iaculis eros. Phasellus pharetra tellus at pellentesque vulputate.",
        "Nam eu libero nec ante facilisis feugiat",
        "Etiam aliquam ultrices suscipit. Morbi est mi, interdum ut ultrices eu, ultrices ac ipsum",
        "Maecenas id erat ac lectus vehicula sollicitudin",
        "Mauris et sapien et enim sagittis blandit ut tempus nulla",
        "Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. Vivamus rhoncus sed nisl sed aliquam. ",
        "Integer aliquam id ante id tempor",
        "Praesent viverra, felis laoreet tempor mollis",
        "nisl ante imperdiet diam",
        "at pharetra arcu leo nec nibh",
        "Vivamus non turpis vel urna blandit",
        "Cras volutpat sodales odio",
        "id posuere nunc placerat non",
        "Donec viverra libero vel varius facilisis",
        "Sed a semper neque, id interdum purus. Quisque in ipsum rutrum, rhoncus sem id, sagittis nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris et ornare diam, sit amet maximus enim."
    ]
    
    class func getData() -> [String] {
        return data
    }
}
