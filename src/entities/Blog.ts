import {
  Entity,
  Column,
  getConnection,
  PrimaryGeneratedColumn,
  Repository,
} from "typeorm";
import Joi from "@hapi/joi";

@Entity()
export class Blog {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ name: "title_image" })
  titleImage: string;

  @Column()
  title: string;

  @Column({ name: "author_id" })
  authorId: string;

  @Column({ name: "author_name" })
  authorName: string;

  @Column({ name: "read_time" })
  readTime: number;

  @Column({ name: "blog_content" })
  blogContent: string;

  @Column({ name: "preview_id", unique: true })
  previewId: string;

  @Column({ default: false })
  isPublic: boolean;
}

export const BlogSchema = Joi.object({
  titleImage: Joi.string().uri(),
  title: Joi.string().min(10),
  readTime: Joi.number(),
  blogContent: Joi.string(),
});

export const BlogRepository = async (): Promise<Repository<Blog>> =>
  getConnection().getRepository(Blog);
