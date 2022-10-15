# BeEM: Conversion of PDBx/mmCIF Files to Best Effort/Minimal Format PDB Files #

The current official format for the Protein Data Bank is [PDBx/mmCIF](https://mmcif.wwpdb.org/). However, there are many structural bioinformatics tools that accepts the legacy [PDB](http://www.wwpdb.org/documentation/file-format-content/format33/v3.3.html) format rather than PDBx/mmCIF format. Some mmCIF structures cannot converted to PDB format, including:

* Entries containing multiple character chain ids
* Entries containing > 62 chains
* Entries containing > 99999 ATOM coordinates
* Entries that have complex beta sheet topology

For these structures, the [Best Effort/Minimal](https://www.rcsb.org/docs/general-help/structures-without-legacy-pdb-format-files) PDB files are provided by the PDB database instead. Unfortunately, [not](https://www.rcsb.org/structure/7NWG) [all](https://www.rcsb.org/structure/7NWH) [best](https://www.rcsb.org/structure/7NWI) effort/minimal files are generated correctly in the PDB database. Moreover, there is no publicly available tool for the generation of Best Effort/Minimal files. To address this issue, we develop BEst Effort/Minimal (BeEM), the first open source implementation for the generation of Best Effort/Minimal file.

## Limitations ##
Best effort/minimal PDB format files contain only authorship, citation details and coordinate data under HEADER, AUTHOR, JRNL, CRYST1, SCALEn, ATOM, HETATM records.

The following PDB records are not included in the official implementation of best effort/minimal files: OBSLTE, TITLE, CAVEAT, COMPND, SOURCE, KEYWDS, EXPDTA, REVDAT, SPRSDE, REMARKS, DBREF, SEQADV, SEQRES, MODRES, HET, HETNAM, HETSYN, FORMUL, HELIX, SHEET, SSBOND, LINK, CISPEP, SITE, ORIGXn, MTRIXn, CONECT.

BeEM may include SEQRES and DBREF.

## Usage ##
Compile the C++ program:
```bash
g++ -O3 BeEM.cpp -o BeEM
```
Example usage:
```bash
curl https://files.rcsb.org/download/4u50.cif -o 4u50.cif
BeEM 4u50.cif
```
Output files will be 4u50-pdb-bundle* for this example.
On Linux, Mac and Windows Subsystem for Linux, BeEM read input files with and without gzip compression.
