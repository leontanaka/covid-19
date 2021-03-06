function usstates = importfile2(filename, dataLines)
%IMPORTFILE2 Import data from a text file
%  USSTATES = IMPORTFILE2(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  USSTATES = IMPORTFILE2(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  usstates = importfile2("/Users/Leontanaka/Desktop/EE608/proj/us-states.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 28-Apr-2020 18:24:52

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["date", "state", "fips", "cases", "deaths"];
opts.VariableTypes = ["datetime", "categorical", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "state", "EmptyFieldRule", "auto");
opts = setvaropts(opts, "date", "InputFormat", "yyyy-MM-dd");

% Import the data
usstates = readtable(filename, opts);

end