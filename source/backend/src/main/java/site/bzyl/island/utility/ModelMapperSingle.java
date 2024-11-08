package site.bzyl.island.utility;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

/**
 * @version 3.5.0
 * @description:  The type Model mapper single.

 * @date  9:45
 */
public class ModelMapperSingle {
    /**
     * The constant modelMapper.
     */
    protected final static ModelMapper modelMapper = new ModelMapper();
    private final static ModelMapperSingle modelMapperSingle = new ModelMapperSingle();

    static {
        modelMapper.getConfiguration().setFullTypeMatchingRequired(true);
        modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    }

    /**
     * Instance model mapper.
     *
     * @return the model mapper
     */
    public static ModelMapper Instance() {
        return modelMapperSingle.modelMapper;
    }
}
