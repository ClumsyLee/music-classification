function features = extract_features(filename)
    FS = 44100;

    % Read the audio and unify its channels and sample rates.
    [audio, fs] = audioread(filename);
    audio = mean(audio, 2);
    audio = resample(audio, FS, fs);
    fs = FS;

    features = my_mfcc(audio, fs);
