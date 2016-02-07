function mfccs = my_mfcc(audio, fs)
    addpath('mfcc/mfcc');

    Tw = 25;           % analysis frame duration (ms)
    Ts = 10;           % analysis frame shift (ms)
    alpha = 0.97;      % preemphasis coefficient
    R = [ 300 3700 ];  % frequency range to consider
    M = 20;            % number of filterbank channels
    C = 13;            % number of cepstral coefficients
    L = 22;            % cepstral sine lifter parameter

    % hamming window (see Eq. (5.2) on p.73 of [1])
    hamming = @(N)(0.54-0.46*cos(2*pi*[0:N-1].'/(N-1)));

    % Feature extraction (feature vectors as columns)
    mfccs = mfcc(audio, fs, Tw, Ts, alpha, hamming, R, M, C, L);

    % Remove NANs.
    mfccs(isnan(mfccs)) = 0;
