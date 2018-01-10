import screed, sys

'''
pip install screed
'''

fp1 = open(sys.argv[2]+ '.pe1.fq', 'w')
fp2 = open(sys.argv[2] + '.pe2.fq', 'w')

n = 0
for record in screed.open(sys.argv[1]):
    if n % 2 == 0:
        fp1.write('%s\n' % ('@' + record.name))
        fp1.write('%s\n' % record.sequence)
        fp1.write('%s\n' % '+')
        fp1.write('%s\n' % record.quality)
    else:
        fp2.write('%s\n' % ('@' + record.name))
        fp2.write('%s\n' % record.sequence)
        fp2.write('%s\n' % '+')
        fp2.write('%s\n' % record.quality)
           
    n = n + 1

