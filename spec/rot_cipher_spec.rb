require "rot_cipher"

describe Rot_cipher do
    
    describe '.run' do
        subject(:instance) { described_class.new }
        context "given 'ABC abc-123', 13, 'e'" do
            it "returns 'NOP nop-123'"do
                expect(instance.run("ABC abc-123",13,'e')).to eq('NOP nop-123')
            end
        end
        context "given 'NOP nop-123', 13, 'd'" do
            it "returns 'ABC abc-123'"do
                expect(instance.run("NOP nop-123",13,'d')).to eq('ABC abc-123')
            end
        end
    end
end