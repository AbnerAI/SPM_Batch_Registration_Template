spm_jobman('initcfg');
dir_path='/sMRI_data/'
files=dir(fullfile(dir_path, '*.nii'))
for i=1:length(files)
    %source
    source=fullfile( dir_path, files(i).name);
    %reference
    reference=fullfile('./Atlas/aal116.nii');
    clear matlabbatch
    %spm12
    matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {reference};
    matlabbatch{1}.spm.spatial.coreg.estwrite.source = {source};
    matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
    matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;
    matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
    matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
    matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
    %
    spm_jobman('run', matlabbatch);
end