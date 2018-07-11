import React from 'react';
import { Cell } from 'fixed-data-table-2';

import SortTypes from '../data/SortTypes';

class TextCell extends React.PureComponent {
  render() {
    const {data, rowIndex, columnKey, ...props} = this.props;

    // Hacky workaround to make filtered sorts work
    // This should be fixed rendering the sorted filter
    // so that this can just call data.getObjectAt(index)
    function getDataObjectAt(data, index) {
      if (Array.isArray(data)) {
        return data[index];
      }

      return data.getObjectAt(index);
    }

    return (
      <Cell {...props}>
        {getDataObjectAt(data, rowIndex)[columnKey]}
      </Cell>
    );
  }
};

class SortHeaderCell extends React.Component {
  constructor(props) {
    super(props);

    this.onSortChange = this.onSortChange.bind(this);
  }

  render() {
    const {onSortChange, sortDir, children, ...props} = this.props;

    return (
      <Cell {...props}>
        <a onClick={this.onSortChange}>
          {children} {sortDir ? (sortDir === SortTypes.DESC ? '↓' : '↑') : ''}
        </a>
      </Cell>
    );
  }

  reverseSortDirection(sortDir) {
    return sortDir === SortTypes.DESC ? SortTypes.ASC : SortTypes.DESC;
  }

  onSortChange(e) {
    e.preventDefault();

    if (this.props.onSortChange) {
      this.props.onSortChange(
        this.props.columnKey,
        this.props.sortDir ?
          this.reverseSortDirection(this.props.sortDir) :
          SortTypes.DESC
      );
    }
  }
}

export { TextCell, SortHeaderCell };
