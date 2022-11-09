import pandas

file = "czid_upload_metadata.csv"

df = pandas.read_csv(file, sep=",")

df["Sample Name"] = df["Sample Name"].str.replace("_R1.fastq.gz", "").str.replace("_R2.fastq.gz", "")

df = df.drop_duplicates(subset="Sample Name")

df.to_csv("czid_upload_metadata_clean.csv", index=False)
