import React from 'react';
import { Table, Column } from 'fixed-data-table-2';

import DataListWrapper from '../data/DataListWrapper';
import SortTypes from '../data/SortTypes';
import { TextCell, SortHeaderCell } from './TableCells';

export default class LibraryPage extends React.Component {
  constructor(props) {
    super(props);

    this.songList = this.props.songs;
    this._defaultSortIndexes = [];

    const size = this.songList.getSize();

    for (let index = 0; index < size; index++) {
      this._defaultSortIndexes.push(index);
    }

    this.state = {
      filteredSongList: this.songList,
      sortedSongList: this.songList,
      colSortDirs: {},
    };

    this.onFilterChange = this.onFilterChange.bind(this);
    this.onSortChange = this.onSortChange.bind(this);
  }

  onFilterChange(e) {
    const filterableKeys = ['title', 'artist', 'album'];
    const filterIndexes = [];
    const filterText = e.target.value.toLowerCase();
    const size = this.songList.getSize();

    for (let index = 0; index < size; index++) {
      const song = this.songList.getObjectAt(index);

      console.log(song);
      let match = true;

      if (filterText) {
        match = Object.keys(song).find((key) => {
          const text = String(song[key]).toLowerCase();
          return text.indexOf(filterText) !== -1 && filterableKeys.indexOf(key) !== -1;
        });
      }

      if (match) {
        filterIndexes.push(index);
      }
    }

    this.setState({
      filteredSongList: new DataListWrapper(filterIndexes, this.songList),
    });
  }

  onSortChange(columnKey, sortDir) {
    const sortIndexes = this._defaultSortIndexes.slice();

    sortIndexes.sort((indexA, indexB) => {
      const valueA = this.songList.getObjectAt(indexA)[columnKey];
      const valueB = this.songList.getObjectAt(indexB)[columnKey];
      let sortVal = 0;

      if (valueA > valueB) {
        sortVal = 1;
      }

      if (valueA < valueB) {
        sortVal = -1;
      }

      if (sortVal !== 0 && sortDir === SortTypes.ASC) {
        sortVal = sortVal * -1;
      }

      return sortVal;
    });

    this.setState({
      sortedSongList: new DataListWrapper(sortIndexes, this.songList),
      colSortDirs: {
        [columnKey]: sortDir,
      },
    });
  }

  render() {
    const {filteredSongList, sortedSongList, colSortDirs} = this.state;

    return (
      <div>
        <br />
        <input
          onChange={this.onFilterChange}
          placeholder="Filter by song title"
        />
        <br />
        <br />
        <Table
          rowHeight={50}
          rowsCount={sortedSongList.getAll().filter(e => filteredSongList.getAll().indexOf(e) !== -1).length}
          headerHeight={50}
          width={1100}
          height={1000}
          {...this.props}>
          <Column
            columnKey="title"
            header={
              <SortHeaderCell
                onSortChange={this.onSortChange}
                sortDir={colSortDirs.title}>
                Title
              </SortHeaderCell>
            }
            cell={
              <TextCell
                // This filtered sort should be put into its own DataListWrapper so that the behavior in
                // TextCell can operate on it without wondering whether its a data object or array
                data={sortedSongList.getAll().filter(e => filteredSongList.getAll().indexOf(e) !== -1)}
              />
            }
            width={300}
          />
          <Column
            columnKey="artist"
            header={
              <SortHeaderCell
                onSortChange={this.onSortChange}
                sortDir={colSortDirs.artist}>
                Artist
              </SortHeaderCell>
            }
            cell={
              <TextCell
                data={sortedSongList.getAll().filter(e => filteredSongList.getAll().indexOf(e) !== -1)}
              />
            }
            width={300}
          />
          <Column
            columnKey="album"
            header={
              <SortHeaderCell
                onSortChange={this.onSortChange}
                sortDir={colSortDirs.album}>
                Album
              </SortHeaderCell>
            }
            cell={
              <TextCell
                data={sortedSongList.getAll().filter(e => filteredSongList.getAll().indexOf(e) !== -1)}
              />
            }
            width={300}
          />
          <Column
            columnKey="trackNumber"
            header={
              <SortHeaderCell
                onSortChange={this.onSortChange}
                sortDir={colSortDirs.trackNumber}>
                Track Number
              </SortHeaderCell>
            }
            cell={
              <TextCell
                data={sortedSongList.getAll().filter(e => filteredSongList.getAll().indexOf(e) !== -1)}
              />
            }
            width={100}
          />
          <Column
            columnKey="year"
            header={
              <SortHeaderCell
                onSortChange={this.onSortChange}
                sortDir={colSortDirs.year}>
                Year
              </SortHeaderCell>
            }
            cell={
              <TextCell
                data={sortedSongList.getAll().filter(e => filteredSongList.getAll().indexOf(e) !== -1)}
              />
            }
            width={100}
          />
        </Table>
      </div>
    );
  }
}
