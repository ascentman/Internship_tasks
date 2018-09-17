/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation
import UIKit

extension SearchViewController: UISearchBarDelegate {

  @objc func dismissKeyboard() {
    searchBar.resignFirstResponder()
  }

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    dismissKeyboard()
    guard let searchText = searchBar.text, !searchText.isEmpty else { return }
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    queryService.getSearchResults(searchTerm: searchText) { results, errorMessage in
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
      if let results = results {
        self.searchResults = results
        self.tableView.reloadData()
        self.tableView.setContentOffset(CGPoint.zero, animated: false)
      }
      if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
    }
  }

  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }

  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    view.addGestureRecognizer(tapRecognizer)
  }

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    view.removeGestureRecognizer(tapRecognizer)
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                  didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                  totalBytesExpectedToWrite: Int64) {
    guard let url = downloadTask.originalRequest?.url,
      let download = downloadService.activeDownloads[url]  else { return }
    download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
    let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
    DispatchQueue.main.async {
      if let trackCell = self.tableView.cellForRow(at: IndexPath(row: download.track.index,
                                                                 section: 0)) as? TrackCell {
        trackCell.updateDisplay(progress: download.progress, totalSize: totalSize)
      }
    }
  }
}
