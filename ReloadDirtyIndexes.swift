if let dirty = cache.getDirty(), !dirtySelected.isEmpty {
    reloadRows(for: dirty)
}

func reloadRows(for items : [Item]) {
    var indexes = Set<IndexPath>()
    
    for item in items {
        guard let visibeIndexes = tableView?.indexPathsForVisibleRows else {
            return
        }
        
        if let indexToReload = tableItems.index(of: item) {
            let newIndexPath = IndexPath(row: indexToReload, section: 0)
            
            if visibeIndexes.contains(where: {$0.section == 0 && $0.row == indexToReload }) {
                indexes.insert(newIndexPath)
            }
        }
    }
    if indexes.count > 0 {
        tableView.reloadRows(at: Array(indexes) , with: .none)
    }
}
