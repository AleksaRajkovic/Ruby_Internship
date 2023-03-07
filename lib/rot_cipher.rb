class Rot_cipher

    def initialize()
        chars='abcdefghijklmnopqrstuvwxyz'
        @cipher=make_cipher(chars)
        @cipher_reversed=make_cipher(chars.reverse)
    end

    def run(msg,offset,mode)
        output=''
        for char in msg.chars do
            output+=get_char(offset,char,mode)
        end
        return output
    end


    private
    def make_cipher(chars)
        cipher={}
        chars.chars.each_with_index do | char, index |
            cipher.store(index,char)
        end
        return cipher
    end


    def get_char(offset,char,mode)
        if(mode=='d')   #decrypt
            cipher=@cipher_reversed
        else    #encrypt
            cipher=@cipher
        end
        if(@cipher.values.include?(char.downcase))
            actual_offset=(offset-((offset+cipher.key(char.downcase))/cipher.keys.length)*cipher.keys.length)
            index=actual_offset+cipher.key(char.downcase)
            if(char==char.downcase)
                return cipher[index]
            else 
                return cipher[index].upcase
            end
        else
            return char
        end

    end
end


    