class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260604-181105"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "04d6885b26eaaf77426570230a507f39e2d20378ea64a838535bf032d8618232"
    sha256 cellar: :any_skip_relocation, sequoia:      "57a576b1479e2f9f0c2324452309c4cf5abc450105f21463443c25ae3f6c89e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f04860e3379317df4313355096ca78cf0fe8b7381ffa800e183ee33b43dd982d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "610205c6ab2e85e3285bbf2df31a746c321a5def66cd6427543be46e250775e7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f851dac9bca925e2934f8f85ff5f17b1913a26eaa6d1bee49993176bcf0393f9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "45102dfb5ad9b65bb2dadf8b05f289f687c568450fad2fe22fc9be456f8f11a9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.702+18b3c78a9.tar.xz"
  version "0.17.0-dev.702+18b3c78a9"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
