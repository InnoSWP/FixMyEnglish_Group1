const logoPath = "assets/logo/logo.png";

/// API url that we use, to detect mistake sentences.
const apiUrl = 'https://aqueous-anchorage-93443.herokuapp.com/FixMyEnglish';

/// [AllowedExtension] for uploaded files while uploading with `upload button`.
const allowedExtensions = <String>['pdf'];

/// Save last [saveNReports] reports made by user,
/// if user will try to make similar one ignore his report.
const int saveNReports = 100;

/// Minimum reporting difference between last two reports.
const limitToMakeQueryDB = 1000; // milliseconds

/// [defaultFileName] for Home Page, while extracting csv file.
const defaultFileName = 'yourFileName';

/// [allowMultipleFileUpload] in Upload File Page with `upload button`.
const allowMultipleFileUpload = true;

/// [allowDragAndDrop] in Upload File Page.
const allowDragAndDrop = true;

// translate label to -> link, height, width of its icon
const labelToIconAsset = <String, Map<String, Object>>{
  'SPOKN1': {
    'link': 'assets/icons/mistake_icon1.png',
    'height': 5,
    'width': 5,
  },
  'SUBJ2': {
    'link': 'assets/icons/mistake_icon2.png',
    'height': 5,
    'width': 5,
  },
  'WORDNES3': {
    'link': 'assets/icons/mistake_icon3.png',
    'height': 5,
    'width': 5,
  },
  'PRONOUN4': {
    'link': 'assets/icons/mistake_icon4.png',
    'height': 5,
    'width': 5,
  },
  'VOCAB5': {
    'link': 'assets/icons/mistake_icon5.png',
    'height': 5,
    'width': 5,
  },
  'TRN6': {
    'link': 'assets/icons/mistake_icon6.png',
    'height': 5,
    'width': 5,
  },
  'LIST7': {
    'link': 'assets/icons/mistake_icon7.png',
    'height': 5,
    'width': 5,
  },
  'DIGIT8': {
    'link': 'assets/icons/mistake_icon1.png',
    'height': 5,
    'width': 5,
  },
  'MISCEL9': {
    'link': 'assets/icons/mistake_icon2.png',
    'height': 5,
    'width': 5,
  },
};
