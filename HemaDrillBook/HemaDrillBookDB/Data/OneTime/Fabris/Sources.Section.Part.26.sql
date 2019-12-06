IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @Section TABLE
    (
        SectionKey INT NOT NULL PRIMARY KEY,
        PartKey INT NOT NULL,
        ParentSectionKey INT NULL,
        SectionName NVARCHAR(250) NOT NULL,
        PageReference NVARCHAR(50) NULL,
        DisplayOrder FLOAT NOT NULL,
        SectionSlug VARCHAR(50) NULL
    );

    INSERT INTO @Section
    (
        SectionKey,
        PartKey,
        ParentSectionKey,
        SectionName,
        PageReference,
        DisplayOrder,
        SectionSlug
    )
    VALUES
    (7113, 26, NULL, N'Part 1 Sword Alone', NULL, 1, 'Part-1-Sword-Alone'),
    (7114, 26, 7113, N'First Rule', NULL, 1, 'Part-1-First-Rule'),
    (7115, 26, 7114, N'Plate 109', NULL, 1, 'Plate-109'),
    (7116, 26, 7114, N'Plate 110', NULL, 2, 'Plate-110'),
    (7117, 26, 7114, N'Plate 111', NULL, 3, 'Plate-111'),
    (7118, 26, 7114, N'Plate 112', NULL, 4, 'Plate-112'),
    (7119, 26, 7114, N'Plate 113', NULL, 5, 'Plate-113'),
    (7120, 26, 7114, N'Plate 114', NULL, 6, 'Plate-114'),
    (7121, 26, 7114, N'Plate 115', NULL, 7, 'Plate-115'),
    (7122, 26, 7114, N'Plate 116', NULL, 8, 'Plate-116'),
    (7123, 26, 7113, N'Second Rule', NULL, 2, 'Part-1-Second-Rule'),
    (7124, 26, 7123, N'Plate 117', NULL, 1, 'Plate-117'),
    (7125, 26, 7123, N'Plate 118', NULL, 2, 'Plate-118'),
    (7126, 26, 7123, N'Plate 119', NULL, 3, 'Plate-119'),
    (7127, 26, 7123, N'Plate 120', NULL, 4, 'Plate-120'),
    (7128, 26, 7123, N'Plate 121', NULL, 5, 'Plate-121'),
    (7129, 26, 7123, N'Plate 122', NULL, 6, 'Plate-122'),
    (7130, 26, 7123, N'Plate 123', NULL, 7, 'Plate-123'),
    (7131, 26, 7113, N'Third Rule', NULL, 3, 'Part-1-Third-Rule'),
    (7132, 26, 7131, N'Plate 124', NULL, 1, 'Plate-124'),
    (7133, 26, 7131, N'Plate 125', NULL, 2, 'Plate-125'),
    (7134, 26, 7131, N'Plate 126', NULL, 3, 'Plate-126'),
    (7135, 26, 7131, N'Plate 127', NULL, 4, 'Plate-127'),
    (7136, 26, 7131, N'Plate 128', NULL, 5, 'Plate-128'),
    (7137, 26, 7131, N'Plate 129', NULL, 6, 'Plate-129'),
    (7138, 26, 7113, N'Fourth Rule', NULL, 4, 'Part-1-Fourth-Rule'),
    (7139, 26, 7138, N'Plate 130', NULL, 1, 'Plate-130'),
    (7140, 26, 7138, N'Plate 131', NULL, 2, 'Plate-131'),
    (7141, 26, 7138, N'Plate 132', NULL, 3, 'Plate-132'),
    (7142, 26, 7138, N'Plate 133', NULL, 4, 'Plate-133'),
    (7143, 26, 7138, N'Plate 134', NULL, 5, 'Plate-134'),
    (7144, 26, 7138, N'Plate 135', NULL, 6, 'Plate-135'),
    (7145, 26, 7138, N'Plate 136', NULL, 7, 'Plate-136'),
    (7146, 26, 7138, N'Plate 137', NULL, 8, 'Plate-137'),
    (7147, 26, 7138, N'Plate 138', NULL, 9, 'Plate-138'),
    (7148, 26, 7138, N'Plate 139', NULL, 10, 'Plate-139'),
    (7149, 26, 7138, N'Plate 140', NULL, 11, 'Plate-140'),
    (7150, 26, 7138, N'Plate 141', NULL, 12, 'Plate-141'),
    (7151, 26, 7113, N'Fifth Rule', NULL, 5, 'Part-1-Fifth-Rule'),
    (7152, 26, 7151, N'Plate 142', NULL, 1, 'Plate-142'),
    (7153, 26, 7151, N'Plate 143', NULL, 2, 'Plate-143'),
    (7154, 26, 7151, N'Plate 144', NULL, 3, 'Plate-144'),
    (7155, 26, 7151, N'Plate 145', NULL, 4, 'Plate-145'),
    (7156, 26, 7151, N'Plate 146', NULL, 5, 'Plate-146'),
    (7157, 26, 7151, N'Plate 147', NULL, 6, 'Plate-147'),
    (7158, 26, 7151, N'Plate 148', NULL, 7, 'Plate-148'),
    (7159, 26, 7151, N'Plate 149', NULL, 8, 'Plate-149'),
    (7160, 26, 7151, N'Plate 150', NULL, 9, 'Plate-150'),
    (7161, 26, 7113, N'Sixth Rule', NULL, 6, 'Part-1-Sixth-Rule'),
    (7162, 26, 7161, N'Plate 151', NULL, 1, 'Plate-151'),
    (7163, 26, 7161, N'Plate 152', NULL, 2, 'Plate-152'),
    (7164, 26, 7161, N'Plate 153', NULL, 3, 'Plate-153'),
    (7165, 26, 7161, N'Plate 154', NULL, 4, 'Plate-154'),
    (7166, 26, 7161, N'Plate 155', NULL, 5, 'Plate-155'),
    (7167, 26, 7161, N'Plate 156 (Mislabled as 157)', NULL, 6, 'Plate-156'),
    (7168, 26, NULL, N'Part 2 Sword and Dagger', NULL, 2, 'Part-2-Sword-and-Dagger'),
    (7169, 26, 7168, N'First Rule', NULL, 1, 'Part-2-First-Rule'),
    (7170, 26, 7169, N'Plate 157', NULL, 1, 'Plate-157'),
    (7171, 26, 7169, N'Plate 158', NULL, 2, 'Plate-158'),
    (7172, 26, 7169, N'Plate 159', NULL, 3, 'Plate-159'),
    (7173, 26, 7168, N'Second Rule', NULL, 2, 'Part-2-Second-Rule'),
    (7174, 26, 7173, N'Plate 160', NULL, 1, 'Plate-160'),
    (7175, 26, 7173, N'Plate 161', NULL, 2, 'Plate-161'),
    (7176, 26, 7173, N'Plate 162', NULL, 3, 'Plate-162'),
    (7177, 26, 7173, N'Plate 163', NULL, 4, 'Plate-163'),
    (7178, 26, 7168, N'Third Rule', NULL, 3, 'Part-2-Third-Rule'),
    (7179, 26, 7178, N'Plate 164', NULL, 1, 'Plate-164'),
    (7180, 26, 7178, N'Plate 165', NULL, 2, 'Plate-165'),
    (7181, 26, 7178, N'Plate 166', NULL, 3, 'Plate-166'),
    (7182, 26, 7178, N'Plate 167', NULL, 4, 'Plate-167'),
    (7183, 26, 7178, N'Plate 168', NULL, 5, 'Plate-168'),
    (7184, 26, 7178, N'Plate 169', NULL, 6, 'Plate-169'),
    (7185, 26, 7178, N'Plate 170', NULL, 7, 'Plate-170'),
    (7186, 26, 7178, N'Plate 171', NULL, 8, 'Plate-171'),
    (7187, 26, 7168, N'Fourth Rule', NULL, 4, 'Part-2-Fourth-Rule'),
    (7188, 26, 7187, N'Plate 172', NULL, 1, 'Plate-172'),
    (7189, 26, 7187, N'Plate 173', NULL, 2, 'Plate-173'),
    (7190, 26, 7187, N'Plate 174', NULL, 3, 'Plate-174'),
    (7191, 26, 7187, N'Plate 175', NULL, 4, 'Plate-175'),
    (7192, 26, 7187, N'Plate 176', NULL, 5, 'Plate-176'),
    (7193, 26, 7187, N'Plate 177', NULL, 6, 'Plate-177'),
    (7194, 26, 7187, N'Plate 178', NULL, 7, 'Plate-178'),
    (7195, 26, NULL, N'Part 3', NULL, 3, 'Part-3'),
    (7196, 26, 7195, N'Plate 179', NULL, 1, 'Plate-179'),
    (7197, 26, 7195, N'Plate 180', NULL, 2, 'Plate-180'),
    (7198, 26, 7195, N'Plate 181', NULL, 3, 'Plate-181'),
    (7199, 26, 7195, N'Plate 182', NULL, 4, 'Plate-182'),
    (7200, 26, 7195, N'Plate 183', NULL, 5, 'Plate-183'),
    (7201, 26, 7195, N'Plate 184', NULL, 6, 'Plate-184'),
    (7202, 26, 7195, N'Empty Hand vs. Dagger', NULL, 7, 'Empty-Hand-vs.-Dagger'),
    (7203, 26, 7202, N'Plate 185', NULL, 1, 'Plate-185'),
    (7204, 26, 7202, N'Plate 186', NULL, 2, 'Plate-186'),
    (7205, 26, 7202, N'Plate 187', NULL, 3, 'Plate-187'),
    (7206, 26, 7202, N'Plate 188', NULL, 4, 'Plate-188'),
    (7207, 26, 7202, N'Plate 189', NULL, 5, 'Plate-189'),
    (7208, 26, 7195, N'Sword vs. Polearms', NULL, 8, 'Sword-vs.-Polearms'),
    (7209, 26, 7208, N'Plate 190', NULL, 1, 'Plate-190');


    MERGE INTO Sources.Section t
    USING @Section s
    ON t.SectionKey = s.SectionKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            SectionKey,
            PartKey,
            ParentSectionKey,
            SectionName,
            PageReference,
            DisplayOrder,
            SectionSlug
        )
        VALUES
        (s.SectionKey, s.PartKey, s.ParentSectionKey, s.SectionName, s.PageReference, s.DisplayOrder, s.SectionSlug)
    WHEN MATCHED THEN
        UPDATE SET t.PartKey = s.PartKey,
                   t.ParentSectionKey = s.ParentSectionKey,
                   t.SectionName = s.SectionName,
                   t.PageReference = s.PageReference,
                   t.DisplayOrder = s.DisplayOrder,
                   t.SectionSlug = s.SectionSlug;

END;
GO
