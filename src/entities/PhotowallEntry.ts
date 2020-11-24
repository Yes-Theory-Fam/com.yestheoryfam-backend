import {
  Entity,
  Column,
  getConnection,
  PrimaryGeneratedColumn,
  Repository,
} from "typeorm";

@Entity()
export class PhotowallEntry {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  fileId: string;

  @Column()
  published: boolean;
}

export const PhotowallEntryRepository = async (): Promise<
  Repository<PhotowallEntry>
> => getConnection().getRepository(PhotowallEntry);
