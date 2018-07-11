export default class DataListWrapper {
  constructor(indexMap, data) {
    this._indexMap = indexMap;
    this._data = data;
  }

  getSize() {
    return this._indexMap.length;
  }

  getObjectAt(index) {
    return this._data.getObjectAt(
      this._indexMap[index],
    );
  }

  getAll() {
    let data = [];

    this._indexMap.forEach((index) => {
      data.push(this._data.getObjectAt(index));
    });

    return data;
  }
}
