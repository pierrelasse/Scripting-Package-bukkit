import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.block.Biome;
import org.bukkit.generator.BiomeProvider;
import org.bukkit.generator.BlockPopulator;
import org.bukkit.generator.ChunkGenerator;
import org.bukkit.generator.WorldInfo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class bukkit_worldmanager_VoidWorldGenerator extends ChunkGenerator {
    public Biome biome = Biome.THE_VOID;
    public List<Biome> biomeList;

    public void generateNoise(WorldInfo worldInfo, Random random, int chunkX, int chunkZ, ChunkData chunkData) {
    }

    public void generateSurface(WorldInfo worldInfo, Random random, int chunkX, int chunkZ, ChunkData chunkData) {
    }

    public void generateBedrock(WorldInfo worldInfo, Random random, int chunkX, int chunkZ, ChunkData chunkData) {
    }

    public void generateCaves(WorldInfo worldInfo, Random random, int chunkX, int chunkZ, ChunkData chunkData) {
    }

    public List<BlockPopulator> getDefaultPopulators(World world) {
        return Collections.emptyList();
    }

    public BiomeProvider getDefaultBiomeProvider(WorldInfo worldInfo) {
        return new BiomeProvider() {
            public Biome getBiome(WorldInfo worldInfo, int i, int i1, int i2) {
                return biome;
            }

            public List<Biome> getBiomes(WorldInfo worldInfo) {
                if (biomeList == null) biomeList = Collections.singletonList(biome);
                return biomeList;
            }
        };
    }

    public boolean canSpawn(World world, int x, int z) {
        return true;
    }

    public Location getFixedSpawnLocation(World world, Random random) {
        return new Location(world, 0, 100, 0);
    }
}
