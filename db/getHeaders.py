import csv

def getHeaders(files):
  for file in files:
    with open(file, 'r') as infile:
      reader = csv.DictReader(infile)
      fieldnames = reader.fieldnames
      print('\n')
      print(file[14:])
      for field in fieldnames:
        print(field)

files = [
  './clean-data/characteristic_reviews.csv',
  './clean-data/questions.csv',
  './clean-data/reviews.csv',
  './clean-data/styles.csv',
  './clean-data/answers_photos.csv',
  './clean-data/answers.csv',
  './clean-data/product.csv',
  './clean-data/reviews_photos.csv',
  './clean-data/cart.csv',
  './clean-data/characteristics.csv',
  './clean-data/features.csv',
  './clean-data/photos.csv',
  './clean-data/related.csv',
  './clean-data/skus.csv'
]

getHeaders(files)