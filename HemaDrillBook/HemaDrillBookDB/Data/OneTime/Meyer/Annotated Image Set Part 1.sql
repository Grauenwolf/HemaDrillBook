SELECT p.PartKey,
       p.BookKey,
       p.PartName,
       p.DisplayOrder,
       p.SysStartTime,
       p.SysEndTime,
       p.PartSlug
FROM Sources.Part p;

SET IDENTITY_INSERT Images.ImageSet ON;
INSERT INTO Images.ImageSet
(
    ImageSetKey,
    ImageSetName,
    PartKey,
    CopyrightHolder,
    Copyright,
    CreatedByUserKey,
    ModifiedByUserKey
)
VALUES
(2, N'L''Meyer Annotated Longsword Images', 1, N'Raymond J. Lord',
 N'The following document is a digital reproduction of an existing 
historical document or manuscript.  It has been scanned and 
converted into Portable Document Format (PDF) for the purpose 
of making it freely available to the public.

Feel free to redistribute unaltered copies of this document via 
electronic means. You may not, however, alter the document 
without permission nor proﬁt from its redistribution.

To download other works in the Collection, and for more 
information, please visit:

www.umass.edu/renaissance/lord', 1, 1);

SET IDENTITY_INSERT Images.ImageSet OFF;
